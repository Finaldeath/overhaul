void main()
{
    object oFollow = GetLocalObject(OBJECT_SELF,"NW_L_M1S5Follow");
    if(GetIsObjectValid(oFollow))
    {
        if(GetArea(OBJECT_SELF) == GetArea(oFollow) &&
           GetDistanceToObject(oFollow) < 15.0)
        {
            ClearAllActions();
            ActionForceMoveToObject(oFollow,TRUE,3.0);
        }
        else
            SetLocalObject(OBJECT_SELF,"NW_L_M1S5Follow",OBJECT_INVALID);
    }
    else
    {
        int nNth = 1;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,nNth);
        while(GetIsObjectValid(oPC))
        {
            if(GetIsObjectValid(GetItemPossessedBy(oPC,"M1S3Fetish")) &&
               GetDistanceToObject(oPC) < 15.0)
                SetLocalObject(OBJECT_SELF,"NW_L_M1S5Follow",oPC);
            nNth++;
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,OBJECT_SELF,nNth);
        }
    }
}
