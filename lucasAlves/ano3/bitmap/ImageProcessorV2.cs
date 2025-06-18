using System;
using System.Diagnostics;
using System.Buffers;

namespace bitmap;

public class ImageProcessorV2
{
    private const int IMAGE_WIDTH = 800;
    private const int IMAGE_HEIGHT = 600;
    private const int TOTAL_IMAGES = 500;

    public static void ProcessImages()
    {
        Console.WriteLine("\n\n\n\u001b[1mIniciando processamento de imagens VERSÂO 2 (V2)...\u001b[0m");

        var stopwatch = Stopwatch.StartNew();
        int processedCount = 0;

        for (int imageIndex = 0; imageIndex < TOTAL_IMAGES; imageIndex++)
        {
            // Gera uma imagem sintética
            PixelRGB[] originalImage = GenerateSyntheticImage(imageIndex);

            // Aplica filtro blur (cria novo array a cada operação)
            PixelRGB[] blurredImage = ApplyBlurFilter(originalImage);

            // Simula salvamento
            processedCount++;
            
            if (imageIndex % 50 == 0)
            {
                Console.WriteLine($"Processadas {imageIndex} imagens...");
            }
        }


        stopwatch.Stop();
        Console.WriteLine($"Processamento concluído!");
        Console.WriteLine($"Imagens processadas: {processedCount}");
        Console.WriteLine($"Tempo total: {stopwatch.ElapsedMilliseconds} ms");
        Console.WriteLine($"Tempo médio por imagem: {stopwatch.ElapsedMilliseconds / (double)processedCount:F2} ms");
    }

    private static PixelRGB[] GenerateSyntheticImage(int seed)
    {
        var pool = ArrayPool<PixelRGB>.Shared;
        PixelRGB[] image = pool.Rent(IMAGE_HEIGHT * IMAGE_WIDTH);
        var random = new Random(seed);

        for (int i = 0; i < IMAGE_HEIGHT; i++)
        {
            for (int j = 0; j < IMAGE_WIDTH; j++)
            {
                image[i*IMAGE_WIDTH + j] = new PixelRGB(
                    (byte)random.Next(256),
                    (byte)random.Next(256),
                    (byte)random.Next(256)
                );
            }
        }

        pool.Return(image);
        return image;
    }

    private static PixelRGB[] ApplyBlurFilter(PixelRGB[] original)
    {
        int lines = IMAGE_HEIGHT;
        int cols = IMAGE_WIDTH;

        var pool = ArrayPool<PixelRGB>.Shared;
        PixelRGB[] blurred = pool.Rent(lines * cols); 

        // Aplicação de blur 2x2 simples
        for (int i = 0; i < lines - 1; i++)
        {
            for (int j = 0; j < cols - 1; j++)
            {
                blurred[i*cols + j] = PixelRGB.Average(
                    original[i*cols + j],  // x, y
                    original[i*cols + j + 1], // x, y+1
                    original[(i+1)*cols + j], // x+1, y
                    original[(i+1)*cols + j + 1] // x+1, y+1
                );
            }
        }

        pool.Return(blurred);
        return blurred;
    }
    
    

    private static void SaveImage(PixelRGB[] image, string filename)
    {
        //
    }
}
