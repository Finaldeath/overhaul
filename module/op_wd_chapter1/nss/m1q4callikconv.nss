void main()
{
    object oNoticed = GetLastPerceived();
    object oTarget = GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack");
    if(GetIsObjectValid(oNoticed))
    {
        if (GetIsPC(oNoticed) && GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 0)
        {
            DelayCommand(1.0,ActionStartConversation(OBJECT_SELF));
        }
        if (GetLastPerceptionSeen() &&
            GetIsEnemy(oNoticed) &&
            !GetIsObjectValid(oTarget))
        {
            ClearAllActions();
            SetListening(OBJECT_SELF,FALSE);
            ActionAttack(oNoticed);
            SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oNoticed);
        }
        else if(GetLastPerceptionVanished() &&
                 GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack") == oNoticed)
        {
            ClearAllActions();
            SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",OBJECT_INVALID);
        }
    }
}
