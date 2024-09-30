#include "op_i_debug"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "DEBUG_EFFECTS")) DebugEffects(GetFirstPC());
}
