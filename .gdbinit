file main.elf
target remote localhost:2000

def flash
  mon prog main.elf
end

