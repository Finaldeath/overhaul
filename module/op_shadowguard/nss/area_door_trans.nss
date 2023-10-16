#include "help_doors"

void main()
{
    object oDoor = OBJECT_SELF;
    object oPC = GetClickingObject();
    oDoor = DoorAreaTransition(oDoor);

    if (GetIsPossessedFamiliar(oPC))
    {
        UnpossessFamiliar(oPC);
    }
    else
    {
        AssignCommand(oPC, JumpToObject(oDoor));
    }
}
