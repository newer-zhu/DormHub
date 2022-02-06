package com.zhuhodor.server.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhuhodor.server.common.domain.Result;
import com.zhuhodor.server.model.pojo.Dorm;
import com.zhuhodor.server.service.IDormService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhuhodor
 * @since 2021-08-12
 */
@RestController
@RequestMapping("/dorm")
public class DormController {
    @Autowired
    private IDormService dormService;

    @ApiOperation("获取所有寝室列表")
    @GetMapping()
    public Result getAllDorms(){
        return Result.success(dormService.list());
    }

    @ApiOperation("获取寝室详情")
    @GetMapping("/{id}")
    public Result getDormById(@PathVariable("id") Integer id){
        return Result.success(dormService.getDormById(id));
    }

    @ApiOperation("获取用户允许预定的寝室列表")
    @GetMapping("/reserve/{userId}")
    public Result getAvailableDorms(@PathVariable("userId") Integer userId){
        //由于分配寝室的逻辑涉及到专业班级和学校的不同，业务复杂，这里就随机模拟分配自己允许预定的10个寝室
        Page<Dorm> page = new Page<Dorm>(1, 10);
        dormService.page(page);
//        int random = new Random().nextInt(list.size() - 9);
//        ArrayList<Dorm> simulation = new ArrayList<>();
//        for (int i = 0; i < 10; i++){
//            simulation.add(list.get(random++));
//        }
        return Result.success(page.getRecords());
    }
}
