void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_Dismissed"))
    {
        int nNth = 1;
        int bFound;
        object oTarget;
        object oDoor = GetNearestObject(OBJECT_TYPE_DOOR,OBJECT_SELF,nNth);
        while (GetIsObjectValid(oDoor) && bFound == FALSE)
        {
            if (GetLocked(oDoor) == FALSE && GetTag(oDoor) != "M1Q4A_M1Q1A")
            {
                bFound = TRUE;
                oTarget = oDoor;
            }
            nNth++;
            oDoor = GetNearestObject(OBJECT_TYPE_DOOR,OBJECT_SELF,nNth);
        }
        if(GetIsObjectValid(oTarget))
        {
            ClearAllActions();
            ActionForceMoveToObject(oTarget,TRUE,2.5);
            ActionMoveToObject(oTarget,TRUE);
            ActionDoCommand(DestroyObject(OBJECT_SELF));
            SetCommandable(FALSE);
        }
    }
    else
    {
        SetLocalObject(OBJECT_SELF,"NW_L_PCMark",OBJECT_INVALID);
        SetLocalInt(OBJECT_SELF,"NW_L_FindMark",0);
        SetLocalInt(OBJECT_SELF,"NW_L_Dismissed",TRUE);
    }
}
