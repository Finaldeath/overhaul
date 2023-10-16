#include "nw_i0_henchman"
#include "M1_PLOT"
void main()
{
    RestoreEveryone();
    StripAllPersonalItemsFromEveryone();
    // * have to delay this so that there is time to strip all the items
    DelayCommand(0.5,StartNewModule("Chapter1E"));
}
