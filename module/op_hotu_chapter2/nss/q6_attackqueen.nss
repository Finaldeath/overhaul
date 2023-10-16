//Queen Attacks, player gets evil hit
//


#include "NW_I0_GENERIC"
#include "nw_i0_plot"

void main()
{
    SetIsTemporaryEnemy(GetPCSpeaker());
    DetermineCombatRound();
    AutoAlignE(DC_HARD, GetPCSpeaker());
}

