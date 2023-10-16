void main()
{
    object oPC = GetLastPerceived();
    if( GetIsPC(oPC) &&
        GetLocalInt(OBJECT_SELF,"L_FireOnce") == FALSE &&
       GetLastPerceptionSeen())
    {
        ActionStartConversation(oPC);
        SetLocalInt(OBJECT_SELF,"L_FireOnce",TRUE);

    }
}
