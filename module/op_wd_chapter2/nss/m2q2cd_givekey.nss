//::///////////////////////////////////////////////
//:: M2Q2CD_GIVEKEY.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives the key to the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF, "M2Q2CD_KEY");
    if (GetIsObjectValid(oKey))
    {
        ActionPauseConversation();
        ActionGiveItem(oKey, GetPCSpeaker());
        SetLocalInt(GetPCSpeaker(),"M2Q2CD_L" + GetTag(OBJECT_SELF),2);
        object oTarget = OBJECT_SELF;
        effect eTelVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eTelVis, oTarget);
        //ActionJumpToObject(GetObjectByTag("WP_M2Q2CD_STGOLEM"));
        ActionResumeConversation();
        DestroyObject(OBJECT_SELF,2.0);
    }
/*    else
    {

    }*/
}
