// * player has full or dead sphere
#include "m3plotinclude"

int StartingConditional()
{

////   & Player has one of the dragon globes, either full or empty (MLiSpDeadDrag3Q4, or MLiSpFullDrag3Q4);

    return PlayerHasFullOrDeadSphere(GetPCSpeaker());
}

