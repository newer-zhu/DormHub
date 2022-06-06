package com.zhuhodor.app.model.vo.echarts;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * eCharts需要的折线图数据类型
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LineVo {
    List<String> xAxis;

    List<Double> yAxis;
}
