//::///////////////////////////////////////////////
//::
//:: Default On Attacked
//::
//:: c_gr_Default_AT.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: If I am attacked, I attack my attacker.
//::
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: Brent
//:: Created On: April 24, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack");
    object oAttacker = GetLastAttacker(OBJECT_SELF);
//*    SpeakString("NW_I_WAS_ATTACKED",TALKVOLUME_SILENT_SHOUT);
    if (GetIsObjectValid(oAttacker) &&
        !GetIsObjectValid(oTarget) &&
        GetIsEnemy(oAttacker) )
    {
      SetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack",oAttacker);
      ClearAllActions();
      ActionAttack(oAttacker);
    }

}
