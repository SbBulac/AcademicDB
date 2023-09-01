PSQL="psql -d academic -U postgres -c "
echo -e "\n~~~~~ ACADEMIC PLACE ~~~~~"

MAIN_MENU(){
if [[ $1 ]]
then
  echo -e "\n$1"
fi

echo "A cual tabla deseas agregar informacion?"

echo -e "\n1. Estudiante\n2. Profesor\n3. Clases\n4. Exit"
read MAIN_MENU_SELECTION

case $MAIN_MENU_SELECTION in
  1) INSERT_ESTUDIANTE ;;
  2) INSERT_PROFESOR ;;
  3) INSERT_CLASES ;;
  4) EXIT ;;
  *) MAIN_MENU "Por favor inserta una opción válida" ;;
esac

}

INSERT_ESTUDIANTE(){
  INSERT_TABLE "estudiante"
}
INSERT_PROFESOR(){
  INSERT_TABLE "profesor"
}
INSERT_CLASES(){
  INSERT_TABLE "clase"
}

INSERT_TABLE(){
    TABLE_NAME=$1

    INSERT_DATA(){

      if [ $TABLE_NAME == "estudiante" ]; then
        echo -e "\nEn esta tabla tienes que diligenciar la siguiente informacion: "
        echo -e "\nnombre\nedad\ndireccion (opcional)\ncelular"
        echo -e "\nCual es el nombre del estudiante?"
        read NOMBRE_ESTUDIANTE
        echo -e "\nCual es la edad del estudiante?"
        read EDAD_ESTUDIANTE
        echo -e "\nCual es el numero de telefono del estudiante?"
        read CELULAR_ESTUDIANTE
        echo "\nDeseas agregar una direccion? (Y/N)"
        read PREGUNTA_DIRECCION
        if [ $PREGUNTA_DIRECCION == "Y" ]; then
          echo "Cual es la direccion del estudiante?"
          read DIRECCION_ESTUDIANTE
          INSERT_BIKE_DATA=$($PSQL "INSERT INTO $TABLE_NAME(nombre, edad, direccion, celular) VALUES ('$NOMBRE_ESTUDIANTE', $EDAD_ESTUDIANTE, '$DIRECCION_ESTUDIANTE', $CELULAR_ESTUDIANTE);")
          echo "\nOk listo, el estudiante ha sido agregado a la base de datos"
        elif [ $PREGUNTA_DIRECCION == "N" ]; then
          INSERT_BIKE_DATA=$($PSQL "INSERT INTO $TABLE_NAME(nombre, edad, celular) VALUES ('$NOMBRE_ESTUDIANTE', $EDAD_ESTUDIANTE, $CELULAR_ESTUDIANTE);")
          echo "\nOk listo, el estudiante ha sido agregado a la base de datos"
        fi


      elif [ $TABLE_NAME == "profesor" ]; then
        echo -e "\nEn esta tabla tienes que diligenciar la siguiente informacion: "
        echo -e "\nnombre\nedad\ndireccion (opcional)\ncelular"
        echo -e "\nCual es el nombre del profesor?"
        read NOMBRE_PROFESOR
        echo -e "\nCual es la edad del profesor?"
        read EDAD_PROFESOR
        echo -e "\nCual es el numero de telefono del profesor?"
        read CELULAR_PROFESOR
        echo "\nDeseas agregar una direccion? (Y/N)"
        read PREGUNTA_DIRECCION
        if [ $PREGUNTA_DIRECCION == "Y" ]; then
          echo "Cual es la direccion del profesor?"
          read DIRECCION_PROFESOR
          INSERT_BIKE_DATA=$($PSQL "INSERT INTO $TABLE_NAME(nombre, edad, direccion, celular) VALUES ('$NOMBRE_PROFESOR', $EDAD_PROFESOR, '$DIRECCION_PROFESOR', $CELULAR_PROFESOR);")
          echo "\nOk listo, el profesor ha sido agregado a la base de datos"
        elif [ $PREGUNTA_DIRECCION == "N" ]; then
          INSERT_BIKE_DATA=$($PSQL "INSERT INTO $TABLE_NAME(nombre, edad, celular) VALUES ('$NOMBRE_PROFESOR', $EDAD_PROFESOR, $CELULAR_PROFESOR);")
          echo "\nOk listo, el profesor ha sido agregado a la base de datos"
        fi
        
      elif [ $TABLE_NAME == "clase" ]; then
        echo -e "\nEn esta tabla tienes que diligenciar la siguiente informacion: "
        echo -e "\nnombre\nhora\nprofesor_id\nestudiante_id"
        echo -e "\nCual es el nombre de la clase?"
        read NOMBRE_CLASE
        echo -e "\nA que hora se da la clase? (HH:MM:SS)"
        read HORA_CLASE
        echo -e "\nCual es el ID del profesor que da la clase?"
        read PROFESOR_ID_CLASE
        echo -e "\nCual es el ID del estudiante que esta en la clase?"
        read ESTUDIANTE_ID_CLASE
        INSERT_BIKE_DATA=$($PSQL "INSERT INTO $TABLE_NAME(nombre, hora, profesor_id, estudiante_id) VALUES ('$NOMBRE_CLASE', '$HORA_CLASE', $PROFESOR_ID_CLASE, $ESTUDIANTE_ID_CLASE);")
        echo -e "\nSe ha agregado la clase"
      fi
      
    }

    echo -e "\nSeleccionaste la tabla: $1"
    INSERT_DATA
    
}

EXIT(){
    echo -e "\nGracias por finalizar el proceso ;)"
}

MAIN_MENU