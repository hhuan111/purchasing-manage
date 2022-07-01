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
@TableName("ex_document")
@ApiModel(value = "Document对象", description = "")
public class Document implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("合同编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("合同名称")
    private String name;

    @ApiModelProperty("单位名称")
    private Integer departmentId;

    @ApiModelProperty("合同信息")
    private String information;

    @TableField(exist = false)
    private String department;

    @TableField(exist = false)
    private String file;

}
