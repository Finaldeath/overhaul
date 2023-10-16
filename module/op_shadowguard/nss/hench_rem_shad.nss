#include "help_hench"

void main()
{
    object oAssoc = GetAssociate(ASSOCIATE_TYPE_HENCHMAN);

    DestroyAssociate(oAssoc, GetClassByPosition(1, oAssoc));
}
