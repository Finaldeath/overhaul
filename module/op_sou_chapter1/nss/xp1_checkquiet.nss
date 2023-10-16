/* TRUE if this is module one and kobolds haven't been killed yet */

#include "x0_i0_common"

int StartingConditional()
{
    if (GetChapter() != 1) return FALSE;

    // Inspect local variables
    return GetLocalInt(OBJECT_SELF, "Hush");
}
