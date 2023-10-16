#include "help_general"

void main()
{
    int nCurr = GetPlotFlag();

    SetPlotFlag(OBJECT_SELF, !nCurr);

    SceneSpeak(OBJECT_SELF, "Plot flag set to " + IntToString(!nCurr));
}
