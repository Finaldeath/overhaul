// * If attacked by Intellect Devourer, become possessed

void main()
{
//object oDevourer = GetObjectByTag("M1Q2_DEVOUR");
//object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if(GetLocalInt(OBJECT_SELF,"M1Q02BloodSailorTransformed") == 1)
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(0));
    }
}
