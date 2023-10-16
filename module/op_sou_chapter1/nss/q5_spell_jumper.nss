//q5_spell_jumper
//Make all other jumpers hostile
#include "nw_i0_generic"
void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF), "X1_JumpersHostile") != 1)
    {
        object oPC = GetLastSpellCaster();
        if (GetIsPC(oPC) == TRUE)
        {
            SetLocalInt(GetArea(OBJECT_SELF), "X1_JumpersHostile", 1);
            int nCount = 0;
            object oKobold = GetObjectByTag("Q5_KOBOLD_JUMPER", nCount);
            while (nCount < 10)
            {
                ChangeToStandardFaction(oKobold, STANDARD_FACTION_HOSTILE);
                AssignCommand(oKobold, DetermineCombatRound(oPC));
                nCount++;
                oKobold = GetObjectByTag("Q5_KOBOLD_JUMPER", nCount);
            }
            object oMaster = GetObjectByTag("Q5_KLUMPH");
            ChangeToStandardFaction(oMaster, STANDARD_FACTION_HOSTILE);
            AssignCommand(oMaster, DetermineCombatRound(oPC));
        }
    }
}
