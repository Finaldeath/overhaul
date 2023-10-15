#include "NW_I0_Generic"
void main()
{
    object oPavel = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_M1Q0DPavel");
    if(GetIsObjectValid(oPavel) && GetObjectSeen(oPavel))
    {
        ClearAllActions();
        ActionCastSpellAtObject(SPELL_MAGIC_MISSILE,oPavel,METAMAGIC_NONE,TRUE);
    }
    else
    {
        DetermineCombatRound();
    }
}
