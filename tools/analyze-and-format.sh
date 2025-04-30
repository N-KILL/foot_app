#!/bin/bash

echo "🔧 Formateando código..."
dart format --line-length 80 --set-exit-if-changed lib test

echo "🔍 Ejecutando análisis estático..."
flutter analyze lib test
