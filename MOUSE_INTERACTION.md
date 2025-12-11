# 鼠标交互功能说明

## 功能介绍
该功能允许使用鼠标射线在流体模拟中创建排斥力，鼠标经过的地方会产生向外推动流体的力。

## 使用方法

### 在编辑器中配置
1. 选择包含 `FluidSim` 脚本的游戏对象
2. 在 Inspector 面板中找到 "Mouse Interaction Settings" 部分
3. 设置以下参数：

#### 参数说明
- **Enable Mouse Interaction**: 启用/禁用鼠标交互功能（勾选启用）
- **Mouse Interaction Radius**: 鼠标影响半径（单位：游戏单位），默认 1.0
  - 控制排斥力的作用范围
  - 值越大，作用范围越广
  
- **Mouse Interaction Strength**: 鼠标交互力度（默认 50.0）
  - 控制排斥力的强度
  - 值越大，推动效果越强
  
- **Main Camera**: 主摄像机引用
  - 自动获取场景中的 Main Camera
  - 如果自动获取失败，请手动拖拽摄像机到此字段

### 运行时效果
- 在游戏运行时移动鼠标，流体会被推开
- 排斥力范围内的粒子会被向外推动
- 力度随距离平方衰减（近处强，远处弱）

## 调整建议
- **小范围精确控制**：设置较小的 Radius（如 0.3-0.5），较大的 Strength（如 30-50）
- **大范围轻微推动**：设置较大的 Radius（如 1.5-2.0），较小的 Strength（如 20-30）
- **强力推流**：设置中等 Radius（如 1.0），较大的 Strength（如 80-100）

## 实现细节
1. **鼠标射线计算**：从摄像机发出射线，计算与模拟盒子的交点
2. **排斥力应用**：在 ExternalForces compute shader 中计算每个粒子受到的排斥力
3. **力的衰减**：使用二次多项式内核（quadratic kernel）实现平滑的力衰减

## 故障排除
- **没有看到任何效果**：
  - 确保 "Enable Mouse Interaction" 已勾选
  - 检查 "Mouse Interaction Strength" 是否为 0
  - 确认摄像机能正确看到流体模拟区域

- **效果过强/过弱**：
  - 调整 "Mouse Interaction Strength" 参数
  - 减小或增加 "Mouse Interaction Radius" 来控制影响范围
