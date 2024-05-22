//::///////////////////////////////////////////////
//:: Overhaul Include: Debug
//:: op_i_debug.nss
//:://////////////////////////////////////////////
/*
    Overhaul debug functions.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

// Debug levels
const int LOG_LEVEL_NONE    = 0;  // No debug - if recompiled all debug is stripped
const int LOG_LEVEL_ERROR   = 1;  // Errors only
const int LOG_LEVEL_WARNING = 2;  // Warnings and errors only
const int LOG_LEVEL_INFO    = 3;  // All debug - every piece of information available

// Set to the types of debug you want as per above
const int DEBUG_LEVEL = LOG_LEVEL_INFO;

// Print sDebug in various places depending on the nDebugLevel
void OP_Debug(string sDebug, int nLogLevel = LOG_LEVEL_INFO);

// Print sDebug in various places depending on the nDebugLevel
void OP_Debug(string sDebug, int nLogLevel = LOG_LEVEL_INFO)
{
    if (nLogLevel > DEBUG_LEVEL) return;

    SendMessageToPC(GetFirstPC(), sDebug);

    // SpeakString(sDebug);

    WriteTimestampedLogEntry(sDebug);
}
