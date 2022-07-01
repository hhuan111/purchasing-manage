package com.hhuan.purchasing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
@TableName("info_dept")
@ApiModel(value = "Dept对象", description = "")
public class Dept implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("单位名称")
    private String name;

    @ApiModelProperty("机构代码")
    private String code;

    @ApiModelProperty("单位性质")
    private String actor;

    @ApiModelProperty("单位地址")
    private String address;

    @ApiModelProperty("采购负责人")
    private String charger;

    @ApiModelProperty("手机")
    private String phone;

    @ApiModelProperty("单位邮箱")
    private String email;

    @ApiModelProperty("办公电话")
    private String telephone;

}
