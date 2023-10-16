#include "NW_I0_Generic"
void main()
{
    object oBloodsailor = GetNearestObjectByTag("M1Q4EWarning");
    SetEncounterActive(TRUE,GetNearestObjectByTag("ENC_M1Q4EWarn"));
    AdjustReputation(GetEnteringObject(),oBloodsailor,-100);
    AssignCommand(oBloodsailor,DetermineCombatRound());
    DestroyObject(OBJECT_SELF);
}
