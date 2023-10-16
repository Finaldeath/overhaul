//Reward for getting past the coloured pillars
//q2b_trg_lev1rwrd
#include "nw_i0_plot"
#include "nw_i0_spells"
void DestroyPillar(object oPillar);
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    Reward_2daXP(oPC, 54);

    //Destroy All The Pillars
    int nRow;
    int nColumn;
    object oPillar;
    string szPillar = "q2bpillar";
    for (nRow = 1; nRow < 6; nRow++)
    {
        for (nColumn = 1; nColumn < 6; nColumn++)
        {
            oPillar = GetObjectByTag(szPillar + IntToString(nRow) + "_" + IntToString(nColumn));

            if (GetIsObjectValid(oPillar) == TRUE)
            {
                DestroyPillar(oPillar);
            }

        }

    }


}

void DestroyPillar(object oPillar)
{

    float fDelay = GetRandomDelay(0.4, 2.0);
    location lVfx = GetLocation(oPillar);
    DestroyObject(oPillar, fDelay);
    if (Random(4) == 3)
    {
        DelayCommand(fDelay - 0.2, PlaySound("bf_huge"));
        DelayCommand(fDelay - 0.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(477), lVfx));
    }
}
