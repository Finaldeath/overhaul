//::///////////////////////////////////////////////
//:: Beam Master (UserDefined)
//:: UD_BeamMaster.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Beam Master's movement.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 12, 2003
//:://////////////////////////////////////////////

void main()
{
    //Fire my AoE spell.
    ClearAllActions();
    ActionCastSpellAtObject(SPELL_WALL_OF_FIRE, OBJECT_SELF, METAMAGIC_EMPOWER, TRUE);

    //Renew my beam effect
    object oServant = GetLocalObject(OBJECT_SELF, "oServant");
    effect eBeam = EffectBeam(VFX_BEAM_FIRE, OBJECT_SELF, BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oServant);

    //Set up my servant's movement
    float fDelay = IntToFloat(Random(12)+6);
    AssignCommand(oServant, ClearAllActions());
    AssignCommand(oServant, ActionRandomWalk());
    DelayCommand(fDelay, SignalEvent(oServant, EventUserDefined(5000)));
}
