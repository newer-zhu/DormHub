package com.zhuhodor.server.common.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JWT工具类
 */
@Slf4j
@Component
public class JwtUtil {
    private static final String CLAIM_KEY_CREATED = "created";
    private static final String CLAIM_KEY_USERNAME = "sub";

    @Value("${jwt.secret}")
    private String secret;
    @Value("${jwt.expiration}")
    private Long expire;

    /**
     * 生成jwt token
     */
    public String generateToken(UserDetails userDetails) {
        HashMap<String, Object> claims = new HashMap<>();
        claims.put(CLAIM_KEY_USERNAME, userDetails.getUsername());
        claims.put(CLAIM_KEY_CREATED, new Date());
        return generateToken(claims);
    }

    /**
     * 生成token（重载）
     * @param claims
     * @return
     */
    private String generateToken(Map<String, Object> claims) {
        return Jwts.builder()
                .setClaims(claims)
                .setExpiration(generateExpirationDate())
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();
    }

    /**
     * 返回失效时间
     * @return
     */
    private Date generateExpirationDate(){
        return new Date(System.currentTimeMillis() + expire*1000);
    }

    /**
     * 获取用户名from token
     * @param token
     * @return
     */
    public String getUsernameByToken(String token){
        String username;
        try{
            Claims claim = getClaimByToken(token);
            username = claim.getSubject();
        }catch (Exception e){
            username = null;
        }
        return username;
    }

    /**
     * 获取荷载
     * @param token
     * @return
     */
    private Claims getClaimByToken(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            log.debug("validate is token error ", e);
            return null;
        }
    }

    /**
     * token是否过期
     *
     * @return true：过期
     */
    private boolean isTokenExpired(String token) {
        Date expireDate = getExpiredDateByToken(token);
        return expireDate.before(new Date());
    }

    /**
     * 从token中获取过期时间
     * @return
     */
    private Date getExpiredDateByToken(String token){
        Claims claim = getClaimByToken(token);
        return claim.getExpiration();
    }

    /**
     * 校验token
     */
    public boolean validateToken(String token, UserDetails userDetails){
        String username = getUsernameByToken(token);
        return username.equals(userDetails.getUsername()) && !isTokenExpired(token);
    }

    /**
     * 判断能否刷新token
     * @param token
     * @return
     */
    public boolean canRefresh(String token){
        return !isTokenExpired(token);
    }

    /**
     * 刷新token
     * @param token
     * @return
     */
    public String refresh(String token){
        Claims claim = getClaimByToken(token);
        claim.put(CLAIM_KEY_CREATED, new Date());
        return generateToken(claim);
    }
}
