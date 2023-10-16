#include "NW_I0_PLOT"
#include "m3plotinclude"
int StartingConditional()
{
    return CheckIntelligenceNormal()
        && PlayerHasAnyDragonSphere(GetPCSpeaker())
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q4HC_DRAGONSPHERE")==0;
    ////   & Player has one of the dragon globes, either full or empty (MLiSpDeadDrag3Q4, MLiSpDragStor3Q4 or MLiSpFullDrag3Q4);

}

