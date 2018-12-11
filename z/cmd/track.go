package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(trackCmd)
	trackCmd.AddCommand(trackListCmd)
	trackCmd.AddCommand(trackStartCmd)
	trackCmd.AddCommand(trackStatusCmd)
	trackCmd.AddCommand(trackStopCmd)
}

var trackCmd = &cobra.Command{
	Use:   "track [COMMAND]",
	Short: "Time Tracking",
	Long:  "Commands for tracking time on projects",
}

var trackListCmd = &cobra.Command{
	Use:   "list",
	Short: "List Tracking",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("TODO: List Tracking")
	},
}

var trackStartCmd = &cobra.Command{
	Use:   "start",
	Short: "Start Tracking",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("TODO: Start Tracking")
	},
}

var trackStatusCmd = &cobra.Command{
	Use:   "status",
	Short: "Tracking Status",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("TODO: Tracking Status")
	},
}

var trackStopCmd = &cobra.Command{
	Use:   "stop",
	Short: "Stop Tracking",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("TODO: Stop Tracking")
	},
}
