package com.hhuan.purchasing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

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
@TableName("bu_plan")
@ApiModel(value = "Plan对象", description = "")
public class Plan implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("采购计划id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("单位id")
    private Integer departmentId;

    @ApiModelProperty("采购计划名称")
    private String name;

    @ApiModelProperty("采购计划总额")
    private Double total;

    @ApiModelProperty("采购计划信息")
    private String information;

    @TableField(exist = false)
    private String department;

}
