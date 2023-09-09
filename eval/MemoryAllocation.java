import java.util.ArrayList;
import java.util.List;

// heap: 10GB (new_size: 9GB)
public class MemoryAllocation {
    public static void main(String[] args) {
        List<byte[]> memoryList = new ArrayList<>();
        long totalMemoryAllocated = 0L;
        int oneMegabyte = 1024 * 1024; // 1MB in bytes

        try {
            while (totalMemoryAllocated < 10L * oneMegabyte * oneMegabyte) { // 10GB in bytes
                byte[] memoryBlock = new byte[oneMegabyte];
                memoryList.add(memoryBlock);
                totalMemoryAllocated += oneMegabyte;
                System.out.println("Allocated 1MB. Total memory allocated: " + totalMemoryAllocated / oneMegabyte + "MB");
            }
        } catch (OutOfMemoryError e) {
            System.err.println("Out of memory after allocating " + totalMemoryAllocated / oneMegabyte + "MB.");
            e.printStackTrace();
        }
    }
}
