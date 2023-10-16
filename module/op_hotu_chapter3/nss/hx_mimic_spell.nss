//::///////////////////////////////////////////////
//:: Name hx_mimic_spell
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
    object oAttacker = GetLastSpellCaster();

    if(GetIsPC(oAttacker))
    {
        //SurrenderToEnemies();
        ClearAllActions();
        AssignCommand(oAttacker, ClearAllActions());
        ClearAllActions();
        ClearPersonalReputation(oAttacker);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), OBJECT_SELF);
        //DelayCommand(2.0, AssignCommand(oAttacker, SpeakString("[NOT IN STRING EDITOR] It doesn't seem affected by your spells.")));
        DelayCommand(2.0, SendMessageToPCByStrRef(oAttacker, 85503));
    }
}
