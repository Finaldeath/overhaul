//:://////////////////////////////////////////////////
//::q2a_death_out
/*
  Summoned Outsider death script for battle 1
 */
//:://////////////////////////////////////////////////
//::
//:: Created By:Keith Warner
//:: Created On: Sept 8/03
//:://////////////////////////////////////////////////



void main()
{

    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nDieOnce", 1);
    SetLocalInt(GetModule(), "X2_BATTLE1Outsider", 0);



}
