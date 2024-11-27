<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ubicación</title>
</head>
<body>
    <h1>Información de la Ubicación</h1>
    
    <?php if (isset($ubicaciones) && !empty($ubicaciones)): ?>  <!-- Verificamos que $ubicaciones esté definida y no vacía -->
        <ul>
            <?php foreach ($ubicaciones as $item): ?>
                <li><?php echo htmlspecialchars($item['nombre']); ?> - <?php echo htmlspecialchars($item['direccion']); ?></li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>No se ha encontrado información sobre la ubicación.</p>
    <?php endif; ?>
</body>
</html>
