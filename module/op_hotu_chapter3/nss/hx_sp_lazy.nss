//::///////////////////////////////////////////////////
//:: hx_sp_lazy
//::
//:: Handles lazy the imp's spawn.
//::
//:: Created By: Brad Prince
//:: Created On: 12/07/2002
//::///////////////////////////////////////////////////
#include "x0_i0_anims"
void main()
{
    object oLazy = OBJECT_SELF;

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), oLazy);
    //AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oLazy));
    //AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oLazy));

    SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    SetSpawnInCondition(NW_FLAG_DEATH_EVENT);
}
