//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Damage
//:: WW1_Ragp_Damage.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Assigns 1 point of damage to the player if
     they lose their finger to the Ragpicker. Set
     the finger local. If they happen to be
     repeating the conversation and have already
     lost a finger, don't re-damage them.

     Destroy whatever ring the player is wearing
     and make the player kneel.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eDamage = EffectDamage(1, DAMAGE_TYPE_SLASHING);
    int bNoFinger = GetLocalInt(oPC, "CONV_RAGPICKER_Fingerless");
    object oGoldRing = GetItemPossessedBy(oPC, "ww1_goldring");
    object oIronRing = GetItemPossessedBy(oPC, "ww1_ironring");

    if (bNoFinger == FALSE)
    {
        //Damage the player.
        SetPlotFlag(oPC, FALSE);
        SetCommandable(FALSE, oPC);
        DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC));
        DelayCommand(0.2, SetCommandable(TRUE, oPC));

        PlayVoiceChat(VOICE_CHAT_PAIN1, oPC);
        SetLocalInt(oPC, "CONV_RAGPICKER_Fingerless", TRUE);
        DestroyObject(oGoldRing);
        DestroyObject(oIronRing);

        //Remove the paralyzation effect.
        object oClone2 = GetLocalObject(oPC, "oCut2_Clone");
        effect eEffect = GetFirstEffect(oClone2);
        int iEffectType = GetEffectType(eEffect);
        while (GetIsEffectValid(eEffect) != FALSE)
        {
            //Remove the paralyzation effect
            if (iEffectType == EFFECT_TYPE_CUTSCENE_PARALYZE)
            {
                RemoveEffect(oClone2, eEffect);
            }
            //Get the next effect
            eEffect = GetNextEffect(oClone2);
        }

        //Make the clone stand and face the ragpicker.
        vector vRagpicker = GetPosition(OBJECT_SELF);
        AssignCommand(oClone2, SetFacingPoint(vRagpicker));
        AssignCommand(oClone2, PlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 5.0));
    }
}
