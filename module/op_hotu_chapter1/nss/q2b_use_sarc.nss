//Create a mummylord when the sarcophagus is used.
#include "nw_i0_generic"

void main()
{

    if (GetLocalInt(OBJECT_SELF,"nUsed") != 1)
    {

        effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
        object oMummy = CreateObject(OBJECT_TYPE_CREATURE,"NW_MUMMYBOSS",GetLocation(OBJECT_SELF));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oMummy));

        object oPC = GetLastUsedBy();
        AssignCommand(oMummy, DetermineCombatRound(oPC));


        SetLocalInt(OBJECT_SELF,"nUsed",1);
    }


}
