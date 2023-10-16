void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, ActionMoveAwayFromObject(oPC, TRUE, 10.0));
}
