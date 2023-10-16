//::///////////////////////////////////////////////
//:: Name hx_throw_onatck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will set the attack target of the devils
     and demons that are throwers.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 21, 2003
//:://////////////////////////////////////////////

void main()
{
    object oAttacker = GetLastAttacker();

    if(GetIsPC(oAttacker))
    {
        SetLocalObject(OBJECT_SELF, "HX_HELL_ENEMY", oAttacker);
    }
    else
    {
        ClearAllActions(TRUE);
        ActionAttack(oAttacker);
    }
}
