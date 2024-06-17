from PIL import Image


def convert_rgb_to_4bit_coe(image_path):
    """
    将RGB图像的一个通道转换为4位深度，并生成COE格式的初始化文件。

    :param image_path: 图片路径
    :param channel: 颜色通道 ('R', 'G', 'B')
    """
    img = Image.open(image_path).convert("RGB")  # 确保是RGB模式
    width, height = img.size

    output_file = f"{image_path}_data.coe"

    with open(output_file, "w") as f:
        f.write("memory_initialization_radix=16;\n")
        f.write(f"memory_initialization_vector=\n")

        for y in range(height):
            for x in range(width):
                r, g, b = img.getpixel((x, y))

                # 根据通道选择值，并转换到4位
                for key in ["R", "G", "B"]:
                    value = {"R": r, "G": g, "B": b}[key]

                    adjusted_value = int(
                        value * (15 / 255)
                    )  # 15 是因为4位能表示的最大十进制数是15

                    hex_value = format(
                        adjusted_value, "01x"
                    )  # 一位16进制表示4位二进制，前面补0

                    f.write(hex_value)

                    # 每8个字符（即32位数据，每个通道4位）后换行
                f.write("\n")
            f.write("\n")

    print(f"转换完成，已生成文件: {output_file}")


image_path = "main_menu.png"
convert_rgb_to_4bit_coe(image_path)
image_path = "help_menu.png"
convert_rgb_to_4bit_coe(image_path)
image_path = "help_menu_2.png"
convert_rgb_to_4bit_coe(image_path)
image_path = "config_menu.png"
convert_rgb_to_4bit_coe(image_path)