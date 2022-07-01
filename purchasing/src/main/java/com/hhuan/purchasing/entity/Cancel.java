package com.hhuan.purchasing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 *
 * </p>
 *
 * @author yingliu
 * @since 2022-05-03
 */
@Getter
@Setter
@TableName("ex_cancel")
@ApiModel(value = "Cancel对象", description = "")
public class Cancel implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("退货编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("退货名称")
    private String name;

    @ApiModelProperty("单位名称")
    private Integer departmentId;

    @ApiModelProperty("退货金额")
    private BigDecimal price;

    @ApiModelProperty("退货时间")
    private LocalDateTime date;

    @TableField(exist = false)
    private String department;

}
