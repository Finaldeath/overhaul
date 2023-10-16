void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    
    if (GetIsObjectValid(oPC) && (GetDistanceBetween(OBJECT_SELF,oPC) < 10.0) && (GetLocalInt(OBJECT_SELF,"M2Q2TerariDialogue") == 0))
    {
        SetLocalInt(OBJECT_SELF,"M2Q2TerariDialogue",1);
        ActionStartConversation(OBJECT_SELF);
    }
}
