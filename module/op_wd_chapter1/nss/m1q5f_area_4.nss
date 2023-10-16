#include "M1_Plot"
void main()
{
    if(GetUserDefinedEventNumber() == 599)
    {
        DestroyUndead(OBJECT_SELF);
    }
}
