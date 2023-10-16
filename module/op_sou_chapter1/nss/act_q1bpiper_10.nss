//Piper turns to face the PC
void main()
{
   object oPC = GetPCSpeaker();
   SetFacingPoint(GetPosition(oPC));
}
