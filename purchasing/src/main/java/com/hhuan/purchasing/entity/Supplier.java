package com.hhuan.purchasing.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.List;

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
@TableName("info_supplier")
@ApiModel(value = "Supplier对象", description = "")
public class Supplier implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("供应商id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("供应商名称")
    private String name;

    @ApiModelProperty("供应商地址")
    private String address;

    @ApiModelProperty("对接负责人")
    private String supplier;

    @ApiModelProperty("联系方式")
    private String phone;

    @ApiModelProperty("供应商邮箱")
    private String email;

    @ApiModelProperty("银行账号")
    private String account;

    @TableField(exist = false)
    private List<Good> goods;

}
