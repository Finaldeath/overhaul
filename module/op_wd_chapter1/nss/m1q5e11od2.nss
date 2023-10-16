void main()
{
    object oDoor3 = GetObjectByTag("M1Q5E11Door3");
    object oDoor4 = GetObjectByTag("M1Q5E11Door4");
    AssignCommand(oDoor3,ActionOpenDoor(oDoor3));
    AssignCommand(oDoor4,ActionOpenDoor(oDoor4));
}
