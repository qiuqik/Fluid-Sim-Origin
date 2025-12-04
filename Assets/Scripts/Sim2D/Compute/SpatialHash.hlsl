static const int2 offsets2D[9] =
{
	int2(-1, 1),
	int2(0, 1),
	int2(1, 1),
	int2(-1, 0),
	int2(0, 0),
	int2(1, 0),
	int2(-1, -1),
	int2(0, -1),
	int2(1, -1),
};

// Constants used for hashing
static const uint hashK1 = 15823;
static const uint hashK2 = 9737333;

// Convert floating point position into an integer cell coordinate
// 将浮点位置转换为整数单元格坐标
int2 GetCell2D(float2 position, float radius)
{
	return (int2)floor(position / radius);
}

// Hash cell coordinate to a single unsigned integer
// 将单元格坐标哈希为单个无符号整数
uint HashCell2D(int2 cell)
{
	cell = (uint2)cell;
	uint a = cell.x * hashK1;
	uint b = cell.y * hashK2;
	return (a + b);
}
// 将输入的哈希值（hash）映射为符合哈希表大小（tableSize）的索引键（Key），
// 用于哈希表中定位数据存储或查询位置。
uint KeyFromHash(uint hash, uint tableSize)
{
	return hash % tableSize;
}
