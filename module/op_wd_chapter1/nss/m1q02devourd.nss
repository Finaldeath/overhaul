void main()
{
int nEvent = GetUserDefinedEventNumber();

switch (nEvent)
{
    case 0: //* Posses next FormerGuard
    {
        SpeakString("Posses");
    }
    break;
    case 1: //* Devourer now Hostile
    {
        object oDevourer = GetObjectByTag("M1Q2_DEVOUR");
        object oFormerGuard = GetObjectByTag("M1Q2_INTFORGUAR");
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

        AdjustReputation(oDevourer,oPC,-100);
        AdjustReputation(oPC,oDevourer,-100);
    }
    break;
}

}
