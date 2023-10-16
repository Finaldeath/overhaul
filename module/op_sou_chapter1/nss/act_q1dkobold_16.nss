//Lodar will face the PC
void main()
{
    object oLodar = GetObjectByTag("q1dlodar");
    AssignCommand(oLodar, SetFacingPoint(GetPosition(GetPCSpeaker())));
}
