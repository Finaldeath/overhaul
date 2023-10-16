//::///////////////////////////////////////////////
//:: Name hx_mimic_attack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will prevent the player from fighting
     the mimic and vice versa.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 13, 2003
//:://////////////////////////////////////////////

void main()
{
    object oAttacker = GetLastAttacker();

    if(GetIsPC(oAttacker))
    {
        //SurrenderToEnemies();
        ClearAllActions();
        AssignCommand(oAttacker, ClearAllActions());
        ClearAllActions();
        ClearPersonalReputation(oAttacker);
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), OBJECT_SELF);
        //DelayCommand(2.0, AssignCommand(oAttacker, SpeakString("[NOT IN STRING EDITOR] It doesn't seem interested in fighting.")));
        DelayCommand(2.0, SendMessageToPCByStrRef(oAttacker, 85501));
    }
}
