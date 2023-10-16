// Get's the facing of the PC Speaker and causes
// NPC to turn in that direction

void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, SetFacingPoint(GetPosition(oPC)));
}
