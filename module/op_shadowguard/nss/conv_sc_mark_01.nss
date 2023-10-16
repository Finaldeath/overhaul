#include "help_general"

void main()
{
    object oLyen = CreateCreatureOnWP("CT_UNIQ_SG_LYEN", GetPCSpeaker());
    object oMarkius = OBJECT_SELF;

    DelayCommand(0.5, AssignCommand(oLyen, ActionMoveToObject(oMarkius, TRUE)));
}
